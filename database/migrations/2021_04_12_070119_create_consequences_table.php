<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateConsequencesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('consequences', function (Blueprint $table) {
            $table->id();
            $table->string('nilai');
            $table->string('konsekuensi');
            $table->string('financial')->default('text');
            $table->string('objective')->default('text');
            $table->string('legal')->default('text');
            $table->string('biaya')->default('text');
            $table->string('reputasi')->default('text');
            $table->string('cakupan')->nullable()->default('text');
            $table->string('lama_pemulihan')->nullable()->default('text');
            $table->string('lama_penyimpangan')->nullable()->default('text');
            $table->string('product_image')->nullable()->default('text');
            $table->string('dampak_sosial')->nullable()->default('text');
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
        Schema::dropIfExists('consequences');
    }
}
