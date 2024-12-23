<?php
 
namespace App\Filament\Pages;
 
use Filament\Pages\Dashboard as BasePage;
use App\Filament\Resources\CashResource;
use App\Filament\Resources\BetsStatsResource;
use App\Filament\Resources\VisualsResource;
class Dashboard extends BasePage
{
    public function getColumns(): int | string | array
    {
        return [
            'sm' => 2,
            'md' => 3,
            'xl' => 5,
        ];
    }

    public function getWidgets(): array
{
    return [
        CashResource\Widgets\Stats::class,
        // DepositResource\Widgets\CustomeStats::class,
        BetsStatsResource\Widgets\Stats::class,
        VisualsResource\Widgets\Visuals::class,
    ];
}
}