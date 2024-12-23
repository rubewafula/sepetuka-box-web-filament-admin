<?php

namespace App\Filament\Resources\VisualsResource\Widgets;
use App\Models\Deposit;
use Filament\Widgets\ChartWidget;
use Flowframe\Trend\Trend;
use Flowframe\Trend\TrendValue;

class Visuals extends ChartWidget
{
    protected static ?string $heading = 'This Weeks Trend';
    protected static ?string $pollingInterval = '10s';
    protected static ?string $maxHeight = '300px';

    protected int | string | array $columnSpan = 'full';
    protected function getData(): array
    {
        $data = Trend::model(Deposit::class)
        ->dateColumn("created")
        ->between(
            start: now()->startOfWeek(),
            end: now()->endOfWeek(),
        )
        ->perDay()
        ->sum('amount');
        return [
            'datasets' => [
                [
                    'label' => 'Weekly Deposits',
                    'data' => $data->map(fn (TrendValue $value) => $value->aggregate),
                ],
                
            ],
        'labels' => $data->map(fn (TrendValue $value) => $value->date),
        ];
    }

    protected function getType(): string
    {
        return 'line';
    }
}
