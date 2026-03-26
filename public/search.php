<?php
$query = isset($_GET['q']) ? trim($_GET['q']) : '';

function search_in_files($query, $dir = 'public') {
    $results = [];

    if ($query === '') {
        return $results;
    }

    $files = scandir($dir);

    foreach ($files as $file) {
        if ($file === '.' || $file === '..') continue;

        $path = $dir . '/' . $file;

        if (is_dir($path)) {
            $results = array_merge($results, search_in_files($query, $path));
        } elseif (pathinfo($path, PATHINFO_EXTENSION) === 'html') {
            $content = file_get_contents($path);
            if (stripos($content, $query) !== false) {
                // extrait
                $pos = stripos(strip_tags($content), $query);
                $start = max(0, $pos - 60);
                $snippet = substr(strip_tags($content), $start, 160);
                $snippet = htmlspecialchars($snippet) . '...';

                $results[] = [
                    'file' => $file,
                    'path' => $path,
                    'snippet' => $snippet
                ];
            }
        }
    }

    return $results;
}

$results = search_in_files($query);
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Recherche — Documentation Samsung</title>
    <link rel="stylesheet" href="theme.css">
</head>
<body>
    <h1>Recherche dans la documentation Samsung</h1>

    <form method="get" action="search.php">
        <input type="text" name="q" value="<?= htmlspecialchars($query) ?>" placeholder="Rechercher..." style="width:300px;">
        <button type="submit">Rechercher</button>
    </form>

    <hr>

    <?php if ($query === ''): ?>
        <p>Entrez un terme de recherche pour commencer.</p>
    <?php else: ?>
        <h2>Résultats pour « <?= htmlspecialchars($query) ?> »</h2>
        <?php if (empty($results)): ?>
            <p>Aucun résultat trouvé.</p>
        <?php else: ?>
            <ul>
                <?php foreach ($results as $r): ?>
                    <li class="card">
                        <a href="<?= str_replace('public/', '', $r['path']) ?>">
                            <?= htmlspecialchars($r['file']) ?>
                        </a>
                        <p><?= $r['snippet'] ?></p>
                    </li>
                <?php endforeach; ?>
            </ul>
        <?php endif; ?>
    <?php endif; ?>
</body>
</html>
