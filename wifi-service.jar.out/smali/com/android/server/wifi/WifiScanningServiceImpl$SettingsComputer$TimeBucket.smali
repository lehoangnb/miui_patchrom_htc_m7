.class Lcom/android/server/wifi/WifiScanningServiceImpl$SettingsComputer$TimeBucket;
.super Ljava/lang/Object;
.source "WifiScanningServiceImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/wifi/WifiScanningServiceImpl$SettingsComputer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TimeBucket"
.end annotation


# instance fields
.field periodInSecond:I

.field periodMaxInSecond:I

.field periodMinInSecond:I

.field final synthetic this$1:Lcom/android/server/wifi/WifiScanningServiceImpl$SettingsComputer;


# direct methods
.method constructor <init>(Lcom/android/server/wifi/WifiScanningServiceImpl$SettingsComputer;III)V
    .locals 0
    .param p1, "this$1"    # Lcom/android/server/wifi/WifiScanningServiceImpl$SettingsComputer;
    .param p2, "p"    # I
    .param p3, "min"    # I
    .param p4, "max"    # I

    .prologue
    .line 934
    iput-object p1, p0, Lcom/android/server/wifi/WifiScanningServiceImpl$SettingsComputer$TimeBucket;->this$1:Lcom/android/server/wifi/WifiScanningServiceImpl$SettingsComputer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 935
    iput p2, p0, Lcom/android/server/wifi/WifiScanningServiceImpl$SettingsComputer$TimeBucket;->periodInSecond:I

    .line 936
    iput p3, p0, Lcom/android/server/wifi/WifiScanningServiceImpl$SettingsComputer$TimeBucket;->periodMinInSecond:I

    .line 937
    iput p4, p0, Lcom/android/server/wifi/WifiScanningServiceImpl$SettingsComputer$TimeBucket;->periodMaxInSecond:I

    .line 934
    return-void
.end method
