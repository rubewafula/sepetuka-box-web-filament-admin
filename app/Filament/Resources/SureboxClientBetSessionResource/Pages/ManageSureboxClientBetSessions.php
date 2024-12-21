<?php

namespace App\Filament\Resources\SureboxClientBetSessionResource\Pages;

use App\Filament\Resources\SureboxClientBetSessionResource;
use Filament\Actions;
use Filament\Resources\Pages\ManageRecords;

class ManageSureboxClientBetSessions extends ManageRecords
{
    protected static string $resource = SureboxClientBetSessionResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
