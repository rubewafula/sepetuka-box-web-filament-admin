<?php

namespace App\Filament\Resources\SureboxBetSessionResource\Pages;

use App\Filament\Resources\SureboxBetSessionResource;
use Filament\Actions;
use Filament\Resources\Pages\ManageRecords;

class ManageSureboxBetSessions extends ManageRecords
{
    protected static string $resource = SureboxBetSessionResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
