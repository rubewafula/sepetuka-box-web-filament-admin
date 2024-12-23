<?php

namespace App\Filament\Resources\BetsStatsResource\Widgets;
use App\Models\SureboxBet;
use App\Models\Inbox;
use App\Models\Outbox;
use Carbon\Carbon;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Card;

class Stats extends BaseWidget
{
    protected ?string $heading = 'Bets';

    protected function getCards(): array
    {
        $todayBets = SureboxBet::whereDate("created", now())->count();
        $weeklyBets = SureboxBet::whereBetween('created', [
            Carbon::now()->startOfWeek(),
            Carbon::now()->endOfWeek()
            ])->count();

        $todayInbox = Inbox::whereDate("created", now())->count();
        $weeklyInbox = Inbox::whereBetween('created', [
            Carbon::now()->startOfWeek(),
            Carbon::now()->endOfWeek()
            ])->count();

        $todayOutbox = Outbox::whereDate("date_created", now())->count();
        $weeklyOutbox = Outbox::whereBetween('date_created', [
            Carbon::now()->startOfWeek(),
            Carbon::now()->endOfWeek()
            ])->count();
        return [
            Card::make('Bets', 'Today: ' . $todayBets)->description('Weekly: ' .  $weeklyBets)->color('success'),
            Card::make('Inbox ' . '', 'Today: ' . $todayInbox)->description('Weekly: ' .  $weeklyInbox)->color('danger'),
            Card::make('Outbox ' . '', 'Today: ' . $todayOutbox)->description('Weekly: ' .  $weeklyOutbox)->color('danger'),

        ];
    }
}
