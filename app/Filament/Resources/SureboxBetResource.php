<?php

namespace App\Filament\Resources;

use App\Filament\Resources\SureboxBetResource\Pages;
use App\Filament\Resources\SureboxBetResource\RelationManagers;
use App\Models\SureboxBet;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class SureboxBetResource extends Resource
{
    protected static ?string $model = SureboxBet::class;

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
                Tables\Columns\TextColumn::make('profile_id'),
                Tables\Columns\TextColumn::make('bet_amount'),
                Tables\Columns\TextColumn::make('created')
                    ->dateTime(),
                Tables\Columns\TextColumn::make('winning_odds'),
                Tables\Columns\TextColumn::make('possible_win'),
                Tables\Columns\TextColumn::make('won'),
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
            'index' => Pages\ManageSureboxBets::route('/'),
        ];
    }
}
