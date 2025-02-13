<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ProfileBalanceResource\Pages;
use App\Filament\Resources\ProfileBalanceResource\RelationManagers;
use App\Models\ProfileBalance;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class ProfileBalanceResource extends Resource
{
    protected static ?string $model = ProfileBalance::class;

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
                Tables\Columns\TextColumn::make('created')
                    ->dateTime()->searchable(),
                Tables\Columns\TextColumn::make('modified')
                    ->dateTime()->sortable(),
                Tables\Columns\TextColumn::make('profile_id')->searchable(),
                Tables\Columns\TextColumn::make('balance')->sortable(),
                Tables\Columns\TextColumn::make('total_deposits')->sortable(),
            ])
	    ->defaultSort('modified', 'desc')
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
            'index' => Pages\ManageProfileBalances::route('/'),
        ];
    }
}
