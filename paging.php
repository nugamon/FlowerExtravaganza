<?php
session_start();

// Получаем параметры фильтрации (например, category_id)
$params = $_GET;
unset($params['page']);
$query = http_build_query($params);
$page_url = basename($_SERVER['PHP_SELF']) . ($query ? '?' . $query . '&' : '?');

// Параметры пагинации
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$records_per_page = isset($records_per_page) ? $records_per_page : 10;

// ! ВАЖНО: $total_rows должен быть посчитан с учётом фильтра/категории!
$total_rows = isset($total_rows) ? $total_rows : 0; // Например, $product->countAll($category_id);

$range = 1;

// Правильное количество страниц
$total_pages = max(1, ceil($total_rows / $records_per_page));

// Не даём выйти за пределы существующих страниц
if ($page > $total_pages) $page = $total_pages;
if ($page < 1) $page = 1;

$start = max(1, $page - $range);
$end = min($total_pages, $page + $range);

echo <<<CSS
<style>
.paginat {
    padding: 24px 0 0 0;
    display: flex;
    justify-content: center;
    gap: 4px;
    list-style: none;
}
.paginat li a, .paginat li span {
    color: #434343;
    background: #fff;
    border: 1px solid #ccc;
    padding: 5px 12px;
    text-decoration: none;
    border-radius: 4px;
    transition: background .2s, color .2s;
}
.paginat li a:hover {
    background: #e53935;
    color: #fff;
    border-color: #e53935;
}
.paginat li.active span {
    background: #e53935;
    color: #fff;
    border-color: #e53935;
    cursor: default;
}
.paginat li.disabled span {
    color: #aaa;
    background: #f5f5f5;
    border-color: #eee;
    cursor: not-allowed;
}
</style>
CSS;

echo "<section class='bg-light'><ul class='paginat'>";

// Кнопка "Первая"
if ($page > 1) {
    echo '<li><a href="' . $page_url . 'page=1" rel="first" aria-label="Первая страница">&laquo; Первая</a></li>';
} else {
    echo '<li class="disabled"><span>&laquo; Первая</span></li>';
}

// Кнопка "Назад"
if ($page > 1) {
    echo '<li><a href="' . $page_url . 'page=' . ($page - 1) . '" rel="prev" aria-label="Предыдущая страница">&lt;</a></li>';
} else {
    echo '<li class="disabled"><span>&lt;</span></li>';
}

// Номера страниц (только существующие!)
for ($i = $start; $i <= $end; $i++) {
    if ($i > $total_pages) break;
    if ($i == $page) {
        echo '<li class="active"><span>' . $i . '</span></li>';
    } else {
        echo '<li><a href="' . $page_url . 'page=' . $i . '">' . $i . '</a></li>';
    }
}

// Кнопка "Вперед"
if ($page < $total_pages) {
    echo '<li><a href="' . $page_url . 'page=' . ($page + 1) . '" rel="next" aria-label="Следующая страница">&gt;</a></li>';
} else {
    echo '<li class="disabled"><span>&gt;</span></li>';
}

// Кнопка "Последняя"
if ($page < $total_pages) {
    echo '<li><a href="' . $page_url . 'page=' . $total_pages . '" rel="last" aria-label="Последняя страница">Последняя &raquo;</a></li>';
} else {
    echo '<li class="disabled"><span>Последняя &raquo;</span></li>';
}

echo "</ul></section>";
?>