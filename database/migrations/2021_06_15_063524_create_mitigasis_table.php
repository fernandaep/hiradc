<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMitigasisTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('mitigasis', function (Blueprint $table) {
            $table->id();
            $table->string('program_mitigasi');
            $table->string('tingkat_resiko');
            $table->string('aspek_lingkungan');
            $table->string('resiko_ditoleransi');
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
        Schema::dropIfExists('mitigasis');
    }
}
