<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ReversedDepositResource\Pages;
use App\Filament\Resources\ReversedDepositResource\RelationManagers;
use App\Models\ReversedDeposit;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class ReversedDepositResource extends Resource
{
    protected static ?string $model = ReversedDeposit::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    
    public static function canCreate(): bool
    {
       return false;
    }
    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                //
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('customer_msisdn')->searchable(),
                Tables\Columns\TextColumn::make('amount')->sortable(),
                Tables\Columns\TextColumn::make('admin_email')->sortable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()->sortable(),
            ])
            ->filters([
                //
            ])
            ->actions([
                // Tables\Actions\EditAction::make(),
                // Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                // Tables\Actions\BulkActionGroup::make([
                //     Tables\Actions\DeleteBulkAction::make(),
                // ]),
            ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ManageReversedDeposits::route('/'),
        ];
    }
}
