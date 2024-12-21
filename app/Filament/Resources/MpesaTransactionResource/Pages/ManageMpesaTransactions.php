<?php

namespace App\Filament\Resources\MpesaTransactionResource\Pages;

use App\Filament\Resources\MpesaTransactionResource;
use Filament\Actions;
use Filament\Resources\Pages\ManageRecords;

class ManageMpesaTransactions extends ManageRecords
{
    protected static string $resource = MpesaTransactionResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
