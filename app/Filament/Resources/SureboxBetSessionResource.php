<?php

namespace App\Filament\Resources;

use App\Filament\Resources\SureboxBetSessionResource\Pages;
use App\Filament\Resources\SureboxBetSessionResource\RelationManagers;
use App\Models\SureboxBetSession;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class SureboxBetSessionResource extends Resource
{
    protected static ?string $model = SureboxBetSession::class;

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
                Tables\Columns\TextColumn::make('start_time')
		 ->sortable()
                ->dateTime(),
                Tables\Columns\TextColumn::make('end_time')
                ->dateTime(),
                Tables\Columns\TextColumn::make('total_bet_amount')->sortable(),
                Tables\Columns\TextColumn::make('total_bets')->sortable(),
                Tables\Columns\TextColumn::make('total_winning_bets'),
                Tables\Columns\TextColumn::make('total_win_amount')->sortable(),
                Tables\Columns\TextColumn::make('total_lost_amount')->sortable(),
	    ])
	    ->defaultSort('start_time', 'desc')
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
            'index' => Pages\ManageSureboxBetSessions::route('/'),
        ];
    }
}
