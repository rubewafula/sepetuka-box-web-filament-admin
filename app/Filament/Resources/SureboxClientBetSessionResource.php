<?php

namespace App\Filament\Resources;

use App\Filament\Resources\SureboxClientBetSessionResource\Pages;
use App\Filament\Resources\SureboxClientBetSessionResource\RelationManagers;
use App\Models\SureboxClientBetSession;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class SureboxClientBetSessionResource extends Resource
{
    protected static ?string $model = SureboxClientBetSession::class;

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
		->sortable()
                ->dateTime(),
                Tables\Columns\TextColumn::make('profile_id')->searchable(),
	    ])
	    ->defaultSort('created', 'desc')
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
            'index' => Pages\ManageSureboxClientBetSessions::route('/'),
        ];
    }
}
