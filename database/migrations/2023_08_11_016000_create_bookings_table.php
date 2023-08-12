<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('bookings', function (Blueprint $table) {
            $table->id();
            $table->dateTime('bookdate');
            $table->unsignedInteger('totaltime');
            $table->unsignedInteger('status');
            $table->string('notes');
            $table->foreignId('room_id')
                ->nullable()
                ->constrained('rooms')
                ->onDelete('SET NULL');
            $table->foreignId('service_id')
                ->nullable()
                ->constrained('services')
                ->onDelete('SET NULL');
            $table->foreignId('promo_id')
                ->nullable()
                ->constrained('promos')
                ->onDelete('SET NULL');
            $table->foreignId('customer_id')
                ->constrained('customers')
                ->cascadeOnDelete();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('bookings');
    }
};
