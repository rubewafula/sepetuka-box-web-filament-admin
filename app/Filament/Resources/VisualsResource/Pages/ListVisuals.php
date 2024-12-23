<?php

namespace App\Filament\Resources\VisualsResource\Pages;

use App\Filament\Resources\VisualsResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListVisuals extends ListRecords
{
    protected static string $resource = VisualsResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
