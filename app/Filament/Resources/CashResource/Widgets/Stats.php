<?php

namespace App\Filament\Resources\CashResource\Widgets;

use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class Stats extends BaseWidget
{
    protected ?string $heading = 'Cash';

    protected function getStats(): array
    {
        return [
            Stat::make('Deposits', '')->description('Weekly: ' .  ' 3000')->color('success'),
            Stat::make('Withdrawals ' . '', '')->description('Weekly: ' .  ' 3000')->color('danger'),
            Stat::make('Account Balance ' . '500', '')->description('Weekly: ' .  ' 3000'),

        ];
    }
}
