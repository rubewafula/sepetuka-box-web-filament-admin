<?php

namespace App\Filament\Resources;

use App\Filament\Resources\VisualsResource\Pages;
use App\Filament\Resources\VisualsResource\RelationManagers;
use App\Models\Visuals;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class VisualsResource extends Resource
{
    protected static ?string $model = Visuals::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

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
                //
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
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
            'index' => Pages\ListVisuals::route('/'),
            'create' => Pages\CreateVisuals::route('/create'),
            'edit' => Pages\EditVisuals::route('/{record}/edit'),
        ];
    }
}
