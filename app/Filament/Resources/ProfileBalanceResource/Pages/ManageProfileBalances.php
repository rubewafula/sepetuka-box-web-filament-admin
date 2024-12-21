<?php

namespace App\Filament\Resources\ProfileBalanceResource\Pages;

use App\Filament\Resources\ProfileBalanceResource;
use Filament\Actions;
use Filament\Resources\Pages\ManageRecords;

class ManageProfileBalances extends ManageRecords
{
    protected static string $resource = ProfileBalanceResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
