<?php

namespace App\Filament\Resources\ReversedDepositResource\Pages;

use App\Filament\Resources\ReversedDepositResource;
use Filament\Actions;
use Filament\Resources\Pages\ManageRecords;

class ManageReversedDeposits extends ManageRecords
{
    protected static string $resource = ReversedDepositResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
