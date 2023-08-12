<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ServiceTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    protected static $items = [
        'Estudio de Grabacion',
        'Sala de Ensayo'
    ];

    public function run(): void
    {
        DB::table('services')->delete();
        foreach (self::$items as $item) {
            DB::table('services')->insert([
                'description' => $item,
                'price' => rand(20,30),
                'available' => true
            ]);
        }
    }
}
