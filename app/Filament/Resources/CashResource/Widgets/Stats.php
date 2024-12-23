<?php

namespace App\Filament\Resources\CashResource\Widgets;
use App\Models\Deposit;
use App\Models\Withdrawal;
use App\Models\ProfileBalance;
use Carbon\Carbon;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Card;

class Stats extends BaseWidget
{
    protected ?string $heading = 'Cash';

    protected function getCards(): array
    {
        $todayDeposits = Deposit::whereDate("created", now())->sum("amount");
        $weeklyDeposits = Deposit::whereBetween('created', [
            Carbon::now()->startOfWeek(),
            Carbon::now()->endOfWeek()
            ])->sum("amount");

        $todayWithdrawals = Withdrawal::whereDate("created", now())->sum("amount");
        $weeklyWithdrawals = Withdrawal::whereBetween('created', [
            Carbon::now()->startOfWeek(),
            Carbon::now()->endOfWeek()
            ])->sum("amount");

        $totalAccountBalance = ProfileBalance::sum("balance");
        return [
            Card::make('Deposits', 'Today: ' . $todayDeposits)->description('Weekly: ' .  $weeklyDeposits)->color('success'),
            Card::make('Withdrawals ' . '', 'Today: ' . $todayWithdrawals)->description('Weekly: ' .  $weeklyWithdrawals)->color('danger'),
            Card::make('Account Balance ' . '', $totalAccountBalance),

        ];
    }
}
