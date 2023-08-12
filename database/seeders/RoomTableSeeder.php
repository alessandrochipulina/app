<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RoomTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    protected static $items = [
        'Sala A',
        'Sala B',
        'Sala C'
    ];

    public function run(): void
    {
        DB::table('rooms')->delete();
        foreach (self::$items as $item) {
            DB::table('rooms')->insert([
                'description' => $item,
                'available' => true
            ]);
        }
    }
}
