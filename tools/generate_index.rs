use std::fs;
use std::path::Path;

fn main() {
    println!("📄 Génération d'un index HTML5 dynamique...");

    let dir = "public";
    let mut entries = Vec::new();

    for entry in fs::read_dir(dir).unwrap() {
        let entry = entry.unwrap();
        let path = entry.path();

        if path.extension().unwrap_or_default() == "html" && path.file_name().unwrap() != "index.html" {
            entries.push(path.file_name().unwrap().to_string_lossy().to_string());
        }
    }

    entries.sort();

    let mut html = String::from(r#"
    <!DOCTYPE html>
    <html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Index Documentation Samsung</title>
        <style>
            body { font-family: Arial; margin: 40px; }
            a { display: block; margin: 8px 0; }
        </style>
    </head>
    <body>
        <h1>Documentation Samsung</h1>
        <ul>
    "#);

    for file in entries {
        html.push_str(&format!("<li><a href=\"{}\">{}</a></li>", file, file));
    }

    html.push_str("</ul></body></html>");

    fs::write("public/index.html", html).unwrap();

    println!("✔ Index généré dans public/index.html");
}
