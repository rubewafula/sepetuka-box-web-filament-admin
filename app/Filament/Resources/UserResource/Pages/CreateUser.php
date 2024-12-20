<?php

namespace App\Filament\Resources\UserResource\Pages;

use App\Filament\Resources\UserResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\Hash;
use Illuminate\Contracts\Support\Htmlable;

class CreateUser extends CreateRecord
{
    protected static string $resource = UserResource::class;

       public function getSubheading(): string|Htmlable|null
    {
        return 'Create an administrator user';
    }

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        $data['password'] = Hash::make($data['password']);

        return $data;
    }
}
