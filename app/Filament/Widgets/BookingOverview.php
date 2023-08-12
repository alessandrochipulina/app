<?php

namespace App\Filament\Widgets;

use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Card;
use App\Models\Booking;
use Illuminate\Support\Facades\DB;

class BookingOverview extends BaseWidget
{
    protected function getStats(): array
    {
        return [
            Card::make('Total sales',            
            Booking::query()->where('status', 1)->
            leftJoin('services', 'services.id', '=', 'bookings.service_id')->
            sum(DB::raw('services.price * bookings.totaltime'))
            ),
            Card::make('Avg Hours x day', rand(1,5) ),
            Card::make('Average time on page', '3:12'),
            Card::make('Estudio de Grabacion', Booking::query()->where('service_id', 1)->count() ),
            Card::make('Sala de Ensayo', Booking::query()->where('service_id', 2)->count() ),
        ];
    }
}
