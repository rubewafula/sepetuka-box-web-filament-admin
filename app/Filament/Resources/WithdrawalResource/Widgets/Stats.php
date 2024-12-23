<?php

namespace App\Filament\Resources\WithdrawalResource\Widgets;

use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class Stats extends BaseWidget
{
    protected ?string $heading = 'Withdrawals';
    protected function getStats(): array
    {
        return [
            Stat::make('Today: ' . '500', '')->description('Weekly: ' .  ' 3000'),
        ];
    }
}
