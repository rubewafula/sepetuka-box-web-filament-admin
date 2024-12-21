<?php

namespace App\Filament\Resources;

use App\Filament\Resources\OutboxResource\Pages;
use App\Filament\Resources\OutboxResource\RelationManagers;
use App\Models\Outbox;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class OutboxResource extends Resource
{
    protected static ?string $model = Outbox::class;

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
                // Tables\Columns\TextColumn::make('shortcode')->searchable(),
                // Tables\Columns\TextColumn::make('network')->sortable(),
                Tables\Columns\TextColumn::make('text')->searchable(),
                Tables\Columns\TextColumn::make('date_sent')
                    ->dateTime(),
                Tables\Columns\TextColumn::make('date_created')
                    ->dateTime(),
                Tables\Columns\TextColumn::make('status')->sortable(),

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
            'index' => Pages\ManageOutboxes::route('/'),
        ];
    }
}
