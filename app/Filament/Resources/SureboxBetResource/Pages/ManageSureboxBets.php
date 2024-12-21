<?php

namespace App\Filament\Resources\SureboxBetResource\Pages;

use App\Filament\Resources\SureboxBetResource;
use Filament\Actions;
use Filament\Resources\Pages\ManageRecords;

class ManageSureboxBets extends ManageRecords
{
    protected static string $resource = SureboxBetResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
