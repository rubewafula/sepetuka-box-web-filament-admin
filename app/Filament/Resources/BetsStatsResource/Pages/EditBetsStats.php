<?php

namespace App\Filament\Resources\BetsStatsResource\Pages;

use App\Filament\Resources\BetsStatsResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditBetsStats extends EditRecord
{
    protected static string $resource = BetsStatsResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
