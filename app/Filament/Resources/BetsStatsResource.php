<?php

namespace App\Filament\Resources;

use App\Filament\Resources\BetsStatsResource\Pages;
use App\Filament\Resources\BetsStatsResource\RelationManagers;
use App\Models\BetsStats;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class BetsStatsResource extends Resource
{
    protected static ?string $model = BetsStats::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    public static function shouldRegisterNavigation(): bool
    {
        // Example: Only show the menu item for users with 'admin' role
        return auth()->user()->hasRole('no-show');
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
            'index' => Pages\ListBetsStats::route('/'),
            'create' => Pages\CreateBetsStats::route('/create'),
            'edit' => Pages\EditBetsStats::route('/{record}/edit'),
        ];
    }
}
