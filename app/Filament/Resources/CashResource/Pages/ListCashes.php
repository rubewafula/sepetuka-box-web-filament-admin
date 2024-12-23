<?php

namespace App\Filament\Resources\CashResource\Pages;

use App\Filament\Resources\CashResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListCashes extends ListRecords
{
    protected static string $resource = CashResource::class;
    public function viewAny(): bool
    {
        return false;
    }
    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
