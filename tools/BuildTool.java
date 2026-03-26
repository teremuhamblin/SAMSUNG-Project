import java.io.*;
import java.nio.file.*;
import java.util.*;

public class BuildTool {

    public static void main(String[] args) {
        System.out.println("===============================================");
        System.out.println("   🚀 Build automatique — Samsung Project");
        System.out.println("===============================================\n");

        try {
            Path srcDir = Paths.get("src-java");
            Path buildDir = Paths.get("build");

            // Création du dossier build
            if (!Files.exists(buildDir)) {
                Files.createDirectory(buildDir);
                System.out.println("📁 Dossier build créé.");
            }

            // Compilation
            System.out.println("🔧 Compilation des fichiers Java...");
            List<String> command = new ArrayList<>();
            command.add("javac");
            command.add("-d");
            command.add("build");

            Files.walk(srcDir)
                .filter(path -> path.toString().endsWith(".java"))
                .forEach(path -> command.add(path.toString()));

            ProcessBuilder pb = new ProcessBuilder(command);
            pb.inheritIO();
            Process process = pb.start();
            process.waitFor();

            System.out.println("✔ Compilation terminée.\n");

            // Copie des ressources
            Path resourcesDir = Paths.get("resources");
            if (Files.exists(resourcesDir)) {
                System.out.println("📦 Copie des ressources...");
                Files.walk(resourcesDir).forEach(path -> {
                    try {
                        Path dest = buildDir.resolve(resourcesDir.relativize(path));
                        if (Files.isDirectory(path)) {
                            if (!Files.exists(dest)) Files.createDirectory(dest);
                        } else {
                            Files.copy(path, dest, StandardCopyOption.REPLACE_EXISTING);
                        }
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                });
                System.out.println("✔ Ressources copiées.\n");
            }

            System.out.println("🎉 Build terminé avec succès !");
        } catch (Exception e) {
            System.out.println("❌ Erreur lors du build : " + e.getMessage());
        }
    }
}
