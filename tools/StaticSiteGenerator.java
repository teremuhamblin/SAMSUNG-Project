import java.io.*;
import java.nio.file.*;
import java.util.*;

public class StaticSiteGenerator {

    public static void main(String[] args) {
        System.out.println("===============================================");
        System.out.println("  🚀 Générateur de site statique Samsung");
        System.out.println("===============================================\n");

        Path docsDir = Paths.get("docs");
        Path outDir = Paths.get("public");

        try {
            if (!Files.exists(outDir)) {
                Files.createDirectory(outDir);
            }

            List<String> pages = new ArrayList<>();

            Files.walk(docsDir)
                .filter(path -> path.toString().endsWith(".md"))
                .forEach(path -> {
                    try {
                        String md = Files.readString(path);
                        String html = convertMarkdownToHtml(md);

                        String filename = path.getFileName().toString().replace(".md", ".html");
                        Path output = outDir.resolve(filename);

                        Files.writeString(output, wrapHtml(filename, html));
                        pages.add(filename);

                        System.out.println("✔ Généré : " + filename);

                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                });

            generateIndex(outDir, pages);
            System.out.println("\n🎉 Site statique généré dans /public/");

        } catch (Exception e) {
            System.out.println("❌ Erreur : " + e.getMessage());
        }
    }

    private static String convertMarkdownToHtml(String md) {
        return md
            .replaceAll("^# (.*)", "<h1>$1</h1>")
            .replaceAll("^## (.*)", "<h2>$1</h2>")
            .replaceAll("^### (.*)", "<h3>$1</h3>")
            .replaceAll("\\*\\*(.*)\\*\\*", "<strong>$1</strong>")
            .replaceAll("\\*(.*)\\*", "<em>$1</em>")
            .replaceAll("`(.*)`", "<code>$1</code>")
            .replaceAll("\n", "<br>");
    }

    private static String wrapHtml(String title, String body) {
        return """
        <!DOCTYPE html>
        <html lang="fr">
        <head>
            <meta charset="UTF-8">
            <title>""" + title + """</title>
            <style>
                body { font-family: Arial; margin: 40px; }
                code { background: #eee; padding: 2px 4px; }
            </style>
        </head>
        <body>
        """ + body + """
        </body>
        </html>
        """;
    }

    private static void generateIndex(Path outDir, List<String> pages) throws IOException {
        StringBuilder sb = new StringBuilder();
        sb.append("<h1>Documentation Samsung</h1><ul>");

        for (String p : pages) {
            sb.append("<li><a href=\"").append(p).append("\">").append(p).append("</a></li>");
        }

        sb.append("</ul>");

        Files.writeString(outDir.resolve("index.html"), wrapHtml("Index", sb.toString()));
    }
}
