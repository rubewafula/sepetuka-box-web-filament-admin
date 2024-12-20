<?php

namespace App\Filament\Resources;

use App\Filament\Resources\WithdrawalResource\Pages;
use App\Filament\Resources\WithdrawalResource\RelationManagers;
use App\Models\Withdrawal;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class WithdrawalResource extends Resource
{
    protected static ?string $model = Withdrawal::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
     public static function canCreate(): bool
    {
        return false;  // Disables the "Create" button
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('inbox_id')
                    ->numeric(),
                Forms\Components\TextInput::make('msisdn')
                    ->required()
                    ->maxLength(25),
                Forms\Components\TextInput::make('profile_id')
                    ->required()
                    ->numeric(),
                Forms\Components\TextInput::make('raw_text')
                    ->maxLength(200),
                Forms\Components\TextInput::make('amount')
                    ->required()
                    ->numeric(),
                Forms\Components\TextInput::make('reference')
                    ->required()
                    ->maxLength(50),
                Forms\Components\DateTimePicker::make('created')
                    ->required(),
                Forms\Components\TextInput::make('created_by')
                    ->required()
                    ->maxLength(45),
                Forms\Components\TextInput::make('status'),
                Forms\Components\TextInput::make('response_status')
                    ->maxLength(250),
                Forms\Components\TextInput::make('provider_reference')
                    ->maxLength(250),
                Forms\Components\TextInput::make('link_id')
                    ->maxLength(100),
                Forms\Components\TextInput::make('number_of_sends')
                    ->required()
                    ->numeric()
                    ->default(0),
                Forms\Components\TextInput::make('charge')
                    ->required()
                    ->numeric()
                    ->default(30),
                Forms\Components\TextInput::make('max_withdraw')
                    ->required()
                    ->numeric()
                    ->default(10000),
                Forms\Components\TextInput::make('network')
                    ->maxLength(200),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('created')
                    ->dateTime()
                    ->sortable(),
                Tables\Columns\TextColumn::make('msisdn')
                    ->searchable(),
                Tables\Columns\TextColumn::make('raw_text')
                    ->searchable(),
                Tables\Columns\TextColumn::make('amount')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('reference')
                    ->searchable(),
                Tables\Columns\TextColumn::make('status'),
                Tables\Columns\TextColumn::make('charge')
                    ->numeric()
                    ->sortable(),
            ])
            ->filters([
                //
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListWithdrawals::route('/'),
        ];
    }
}
