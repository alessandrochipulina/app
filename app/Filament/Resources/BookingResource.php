<?php

namespace App\Filament\Resources;

use Illuminate\Support\Facades\DB;
use App\Filament\Resources\BookingResource\Pages;
use Filament\Tables\Columns\Summarizers\Summarizer;
use Filament\Tables\Columns\Summarizers\Sum;
use App\Filament\Resources\BookingResource\RelationManagers;
use App\Models\Booking;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use App\Filament\Resources\CustomerResource;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Columns\Layout\Split;

class BookingResource extends Resource
{
    protected static ?string $model = Booking::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Select::make('customer_id')
                ->relationship('customer', 'name')
                ->required()
                ->searchable()
                ->preload()
                ->createOptionForm( CustomerResource::customerForm() ),
                Forms\Components\Select::make('service_id')
                    ->relationship('service', 'description')
                    ->required()
                    ->searchable()
                    ->preload(),
                Forms\Components\DateTimePicker::make('bookdate')
                    ->label('Date')
                    ->required()
                    ->minDate(now()),
                Forms\Components\Select::make('room_id')
                    ->relationship('room', 'description')
                    ->required()
                    ->preload(),
                Forms\Components\Select::make('totaltime')
                    ->label('Total time')
                    ->options([
                        1 => '1 Hour',
                        2 => '2 Hours',
                        3 => '3 Hours',
                        4 => '4 Hours',
                        5 => '5 Hours',
                        6 => '6 Hours',
                        7 => '7 Hours',
                        8 => '8 Hours',                    
                    ])->required(),
                Forms\Components\Select::make('status')
                    ->options([
                        0 => 'Pending Payment',
                        1 => 'Completed',
                        2 => 'Refunded',                   
                    ])->required(),
                Forms\Components\TextInput::make('notes')
                    ->maxLength(2000)
                    ->columnSpanFull(),
                Forms\Components\Select::make('promo_id')
                    ->relationship('promo', 'promocode')
                    ->searchable()
                    ->preload(),                
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Split::make([
                    Tables\Columns\TextColumn::make('service.description')
                        ->sortable(),                                         
                    Tables\Columns\TextColumn::make('customer.name')
                        // ->description(fn (Post $record): string => $record->description)
                        ->sortable()
                        ->searchable(),
                    Tables\Columns\TextColumn::make('bookdate')
                        ->sortable(),
                    Tables\Columns\TextColumn::make('totaltime'),                    
                    Tables\Columns\IconColumn::make('status')
                        ->icon(fn (string $state): string => match ($state) {
                            '0' => 'heroicon-o-clock',
                            '1' => 'heroicon-o-check-circle',
                            '2' => 'heroicon-o-x-mark',
                            default => 'heroicon-o-pencil'
                        })
                        ->color(fn (string $state): string => match ($state) {
                            '0' => 'info',
                            '1' => 'success',
                            '2' => 'danger',
                            default => 'gray',
                        })
                        ->size('lg'),
                    
                    /*
                    Tables\Columns\SelectColumn::make('status')
                        ->options([
                            0 => 'Pending Payment',
                            1 => 'Completed',
                            2 => 'Refunded',
                        ]),
                    */
                    /*
                    Tables\Columns\TextColumn::make('price')
                        ->summarize(
                            Summarizer::make()
                            ->label('Total (S./)')
                            ->using(
                                fn (\Illuminate\Database\Query\Builder $query): string => 
                                $query->  
                                from('bookings')->
                                leftJoin('services', 'services.id', '=', 'bookings.service_id')->
                                sum(DB::raw('services.price * bookings.totaltime'))                                
                            )
                        ),  
                    */ 
                ])->from('md')
            ])
                ->filters([
                Tables\Filters\SelectFilter::make('status')
                    ->options([
                        0 => 'Pending Payment',
                        1 => 'Completed',
                        2 => 'Refunded',
                    ]),
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
            'index' => Pages\ListBookings::route('/'),
            'create' => Pages\CreateBooking::route('/create'),
            'edit' => Pages\EditBooking::route('/{record}/edit'),
        ];
    }    
}
