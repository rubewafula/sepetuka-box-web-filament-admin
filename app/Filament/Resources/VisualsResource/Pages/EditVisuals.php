<?php

namespace App\Filament\Resources\VisualsResource\Pages;

use App\Filament\Resources\VisualsResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditVisuals extends EditRecord
{
    protected static string $resource = VisualsResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
