<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRegistersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('registers', function (Blueprint $table) {
            $table->id();
            $table->string('unit_kerja');
            $table->string('lokasi');
            $table->string('pengendalian');
            $table->string('kemungkinan_id');
            $table->string('konsekuensi_id');
            $table->string('tingkat_resiko');
            $table->string('status_regulasi');
            $table->string('aspek_lingkungan');
            $table->string('peluang');
            $table->string('resiko');
            $table->string('resiko_ditoleransi');
            $table->string('cakupan_resiko');
            $table->string('status_program');
            $table->string('program');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('registers');
    }
}
