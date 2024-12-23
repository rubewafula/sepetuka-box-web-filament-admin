<?php

namespace App\Filament\Resources\BetsStatsResource\Widgets;

use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class Stats extends BaseWidget
{
    protected ?string $heading = 'Bets';

    protected function getStats(): array
    {
        return [
            Stat::make('Deposits', '')->description('Weekly: ' .  ' 3000')->color('success'),
            Stat::make('Today: ' . '', '')->description('Weekly: ' .  ' 3000')->color('danger'),
            Stat::make('Today: ' . '500', '')->description('Weekly: ' .  ' 3000'),

        ];
    }
}
