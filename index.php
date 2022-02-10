<?php

declare(strict_types=1);

use Prometheus\RenderTextFormat;

require_once __DIR__ . '/vendor/autoload.php';

$registry = new \Prometheus\CollectorRegistry(new \Prometheus\Storage\InMemory());

$counter = $registry->getOrRegisterCounter('test', 'some_counter', 'it increases', ['type']);
$counter->incBy(3, ['blue']);

$gauge = $registry->getOrRegisterGauge('test', 'some_gauge', 'it sets', ['type']);
$gauge->set(2.5, ['blue']);

$histogram = $registry->getOrRegisterHistogram('test', 'some_histogram', 'it observes', ['type'], [0.1, 1, 2, 3.5, 4, 5, 6, 7, 8, 9]);
$histogram->observe(3.5, ['blue']);

$summary = $registry->getOrRegisterSummary('test', 'some_summary', 'it observes a sliding window', ['type'], 84600, [0.01, 0.05, 0.5, 0.95, 0.99]);
$histogram->observe(5, ['blue']);

$renderer = new RenderTextFormat();
$result = $renderer->render($registry->getMetricFamilySamples());

header('Content-type: ' . RenderTextFormat::MIME_TYPE);
echo $result;

//echo 'api_http_requests_total{method="POST",handler="/messages"} 12' . PHP_EOL;
////echo '<br>';
//echo 'foo_bar{controller="controller",action="action"} 14';