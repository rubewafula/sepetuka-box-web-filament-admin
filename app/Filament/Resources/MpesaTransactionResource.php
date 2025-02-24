<?php

namespace App\Filament\Resources;

use App\Filament\Resources\MpesaTransactionResource\Pages;
use App\Filament\Resources\MpesaTransactionResource\RelationManagers;
use App\Models\MpesaTransaction;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class MpesaTransactionResource extends Resource
{
    protected static ?string $model = MpesaTransaction::class;

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
                Tables\Columns\TextColumn::make('msisdn')->searchable(),
                Tables\Columns\TextColumn::make('shortcode')->searchable(),
                Tables\Columns\TextColumn::make('network')->sortable(),
                Tables\Columns\TextColumn::make('message')->searchable(),
                Tables\Columns\TextColumn::make('created')
                    ->dateTime(),
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
            'index' => Pages\ManageMpesaTransactions::route('/'),
        ];
    }
}
