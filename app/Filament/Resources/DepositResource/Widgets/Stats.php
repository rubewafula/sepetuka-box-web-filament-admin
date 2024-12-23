<?php

namespace App\Filament\Resources\DepositResource\Widgets;

use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class Stats extends BaseWidget
{
    protected ?string $heading = 'Deposits';

    protected function getStats(): array
    {

        return [
            Stat::make(
                label: 'Today',
                value: BlogPost::query()
                    ->when($startDate, fn (Builder $query) => $query->whereDate('created_at', '>=', $startDate))
                    ->when($endDate, fn (Builder $query) => $query->whereDate('created_at', '<=', $endDate))
                    ->count(),
            ),

            Stat::make('Today: ' . '500', '')->description('Weekly: ' .  ' 3000'),
            
        ];
    }

}
