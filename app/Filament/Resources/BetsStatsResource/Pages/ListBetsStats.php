<?php

namespace App\Filament\Resources\BetsStatsResource\Pages;

use App\Filament\Resources\BetsStatsResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListBetsStats extends ListRecords
{
    protected static string $resource = BetsStatsResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
