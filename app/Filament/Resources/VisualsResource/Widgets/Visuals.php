<?php

namespace App\Filament\Resources\VisualsResource\Widgets;

use Filament\Widgets\ChartWidget;

class Visuals extends ChartWidget
{
    protected static ?string $heading = 'Chart';

    protected function getData(): array
    {
        return [
            //
        ];
    }

    protected function getType(): string
    {
        return 'polarArea';
    }
}
