<?php

namespace App\Filament\Resources;

use App\Filament\Resources\CustomerResource\Pages;
use App\Filament\Resources\CustomerResource\RelationManagers;
use App\Models\Customer;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Tables\Columns\Layout\Split;
use Filament\Tables\Columns\Layout\Stack;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class CustomerResource extends Resource
{
    protected static ?string $model = Customer::class;

    protected static ?string $navigationIcon = 'heroicon-o-user';

    public static function customerForm(): array
    {
        return [
            Forms\Components\TextInput::make('name')
                        ->label('Full name')
                        ->required()
                        ->maxLength(255)
                        ->suffixIcon('heroicon-o-user'),
            Forms\Components\TextInput::make('identification')
                        ->label('DNI/Passport')
                        ->required()
                        ->maxLength(255)
                        ->suffixIcon('heroicon-o-flag'),                   
            Forms\Components\TextInput::make('phone')
                        ->label('Phone number')
                        ->tel()
                        ->required()
                        ->suffixIcon('heroicon-o-phone'),    
            Forms\Components\Fieldset::make('Optional Data')
                        ->schema([
                            Forms\Components\TextInput::make('address')
                                ->suffixIcon('heroicon-o-map-pin'),
                            Forms\Components\Select::make('district')
                                ->options([
                                        'Miraflores' => 'Miraflores',
                                        'Surco' => 'Surco',
                                        'Lima' => 'Lima',
                                        'San Miguel' => 'San Miguel',
                                        'Magdalena' => 'Magdalena',
                                        'Jesus Maria' => 'Jesus Maria',
                                        'Pueblo Libre' => 'Pueblo Libre',
                                        'Callao' => 'Callao',   
                                        'La Perla' => 'La Perla',   
                                    ]),
                            Forms\Components\TextInput::make('email')
                                    ->label('Email address')
                                    ->email()
                                    ->maxLength(255)
                                    ->suffixIcon('heroicon-o-envelope'),
                            Forms\Components\DatePicker::make('birthday')
                                ->maxDate(now())  
                        ])
        ];
    } 

    public static function form(Form $form): Form
    {
        return $form
            ->schema(
                self::customerForm(),
            );
    }

    public static function table(Table $table): Table
    {
        return $table
            ->striped()
            ->columns([
                Split::make([
                    Tables\Columns\TextColumn::make('name')
                        ->label('Full name')
                        ->sortable()
                        ->searchable(),
                    Tables\Columns\TextColumn::make('identification')
                        ->icon('heroicon-o-flag')
                        ->label('DNI/Passport')
                        ->searchable()
                        ->sortable(),
                    Stack::make([
                        Tables\Columns\TextColumn::make('phone')
                            ->icon('heroicon-o-phone')
                            ->searchable()
                            ->sortable(),
                        Tables\Columns\TextColumn::make('email')
                            ->icon('heroicon-o-envelope')
                            ->searchable()
                            ->sortable(),
                    ]),
                    Tables\Columns\TextColumn::make('bookings_count')->counts('bookings')
                        ->icon('heroicon-o-rectangle-stack')
                        ->sortable()
                        ->label('Bookings')
                ])->from('md')                
            ])
            ->contentGrid([
                'md' => 1,
                'xl' => 2,
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
            'index' => Pages\ListCustomers::route('/'),
            'create' => Pages\CreateCustomer::route('/create'),
            'edit' => Pages\EditCustomer::route('/{record}/edit'),
        ];
    }    
}
