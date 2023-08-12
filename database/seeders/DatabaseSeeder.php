<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run()
    {
        DB::table('bookings')->delete();
        $this->call(RoomTableSeeder::class);
        $this->call(ServiceTableSeeder::class);
        $this->call(CustomerTableSeeder::class);
        // \App\Models\User::factory(10)->create();

        User::create([
            'name' => 'admin',
            'email' => 'admin@estudio.com',
            'password' => Hash::make('admin2023'),
        ]);
    }
}
