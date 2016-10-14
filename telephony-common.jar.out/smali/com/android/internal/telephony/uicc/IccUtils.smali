.class public Lcom/android/internal/telephony/uicc/IccUtils;
.super Ljava/lang/Object;
.source "IccUtils.java"


# static fields
.field static final LOG_TAG:Ljava/lang/String; = "IccUtils"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static adnStringFieldToString([BII)Ljava/lang/String;
    .locals 18
    .param p0, "data"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I

    .prologue
    .line 180
    if-nez p2, :cond_0

    .line 181
    const-string/jumbo v15, ""

    return-object v15

    .line 183
    :cond_0
    const/4 v15, 0x1

    move/from16 v0, p2

    if-lt v0, v15, :cond_2

    .line 184
    aget-byte v15, p0, p1

    const/16 v16, -0x80

    move/from16 v0, v16

    if-ne v15, v0, :cond_2

    .line 185
    add-int/lit8 v15, p2, -0x1

    div-int/lit8 v14, v15, 0x2

    .line 186
    .local v14, "ucslen":I
    const/4 v11, 0x0

    .line 189
    .local v11, "ret":Ljava/lang/String;
    :try_start_0
    new-instance v12, Ljava/lang/String;

    add-int/lit8 v15, p1, 0x1

    mul-int/lit8 v16, v14, 0x2

    const-string/jumbo v17, "utf-16be"

    move-object/from16 v0, p0

    move/from16 v1, v16

    move-object/from16 v2, v17

    invoke-direct {v12, v0, v15, v1, v2}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v11    # "ret":Ljava/lang/String;
    .local v12, "ret":Ljava/lang/String;
    move-object v11, v12

    .line 195
    .end local v12    # "ret":Ljava/lang/String;
    :goto_0
    if-eqz v11, :cond_2

    .line 198
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v14

    .line 199
    :goto_1
    if-lez v14, :cond_1

    add-int/lit8 v15, v14, -0x1

    invoke-virtual {v11, v15}, Ljava/lang/String;->charAt(I)C

    move-result v15

    const v16, 0xffff

    move/from16 v0, v16

    if-ne v15, v0, :cond_1

    .line 200
    add-int/lit8 v14, v14, -0x1

    goto :goto_1

    .line 190
    .restart local v11    # "ret":Ljava/lang/String;
    :catch_0
    move-exception v7

    .line 191
    .local v7, "ex":Ljava/io/UnsupportedEncodingException;
    const-string/jumbo v15, "IccUtils"

    const-string/jumbo v16, "implausible UnsupportedEncodingException"

    move-object/from16 v0, v16

    invoke-static {v15, v0, v7}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 202
    .end local v7    # "ex":Ljava/io/UnsupportedEncodingException;
    .end local v11    # "ret":Ljava/lang/String;
    :cond_1
    const/4 v15, 0x0

    invoke-virtual {v11, v15, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v15

    return-object v15

    .line 207
    .end local v14    # "ucslen":I
    :cond_2
    const/4 v8, 0x0

    .line 208
    .local v8, "isucs2":Z
    const/4 v3, 0x0

    .line 209
    .local v3, "base":C
    const/4 v9, 0x0

    .line 211
    .local v9, "len":I
    const/4 v15, 0x3

    move/from16 v0, p2

    if-lt v0, v15, :cond_6

    aget-byte v15, p0, p1

    const/16 v16, -0x7f

    move/from16 v0, v16

    if-ne v15, v0, :cond_6

    .line 212
    add-int/lit8 v15, p1, 0x1

    aget-byte v15, p0, v15

    and-int/lit16 v9, v15, 0xff

    .line 213
    add-int/lit8 v15, p2, -0x3

    if-le v9, v15, :cond_3

    .line 214
    add-int/lit8 v9, p2, -0x3

    .line 216
    :cond_3
    add-int/lit8 v15, p1, 0x2

    aget-byte v15, p0, v15

    and-int/lit16 v15, v15, 0xff

    shl-int/lit8 v15, v15, 0x7

    int-to-char v3, v15

    .line 217
    .local v3, "base":C
    add-int/lit8 p1, p1, 0x3

    .line 218
    const/4 v8, 0x1

    .line 230
    .end local v3    # "base":C
    :cond_4
    :goto_2
    if-eqz v8, :cond_a

    .line 231
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    .line 233
    .local v13, "ret":Ljava/lang/StringBuilder;
    :goto_3
    if-lez v9, :cond_9

    .line 236
    aget-byte v15, p0, p1

    if-gez v15, :cond_5

    .line 237
    aget-byte v15, p0, p1

    and-int/lit8 v15, v15, 0x7f

    add-int/2addr v15, v3

    int-to-char v15, v15

    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 238
    add-int/lit8 p1, p1, 0x1

    .line 239
    add-int/lit8 v9, v9, -0x1

    .line 244
    :cond_5
    const/4 v4, 0x0

    .line 245
    .local v4, "count":I
    :goto_4
    if-ge v4, v9, :cond_8

    add-int v15, p1, v4

    aget-byte v15, p0, v15

    if-ltz v15, :cond_8

    .line 246
    add-int/lit8 v4, v4, 0x1

    goto :goto_4

    .line 219
    .end local v4    # "count":I
    .end local v13    # "ret":Ljava/lang/StringBuilder;
    .local v3, "base":C
    :cond_6
    const/4 v15, 0x4

    move/from16 v0, p2

    if-lt v0, v15, :cond_4

    aget-byte v15, p0, p1

    const/16 v16, -0x7e

    move/from16 v0, v16

    if-ne v15, v0, :cond_4

    .line 220
    add-int/lit8 v15, p1, 0x1

    aget-byte v15, p0, v15

    and-int/lit16 v9, v15, 0xff

    .line 221
    add-int/lit8 v15, p2, -0x4

    if-le v9, v15, :cond_7

    .line 222
    add-int/lit8 v9, p2, -0x4

    .line 224
    :cond_7
    add-int/lit8 v15, p1, 0x2

    aget-byte v15, p0, v15

    and-int/lit16 v15, v15, 0xff

    shl-int/lit8 v15, v15, 0x8

    .line 225
    add-int/lit8 v16, p1, 0x3

    aget-byte v16, p0, v16

    move/from16 v0, v16

    and-int/lit16 v0, v0, 0xff

    move/from16 v16, v0

    .line 224
    or-int v15, v15, v16

    int-to-char v3, v15

    .line 226
    .local v3, "base":C
    add-int/lit8 p1, p1, 0x4

    .line 227
    const/4 v8, 0x1

    goto :goto_2

    .line 248
    .end local v3    # "base":C
    .restart local v4    # "count":I
    .restart local v13    # "ret":Ljava/lang/StringBuilder;
    :cond_8
    move-object/from16 v0, p0

    move/from16 v1, p1

    invoke-static {v0, v1, v4}, Lcom/android/internal/telephony/GsmAlphabet;->gsm8BitUnpackedToString([BII)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 251
    add-int p1, p1, v4

    .line 252
    sub-int/2addr v9, v4

    goto :goto_3

    .line 255
    .end local v4    # "count":I
    :cond_9
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    return-object v15

    .line 258
    .end local v13    # "ret":Ljava/lang/StringBuilder;
    :cond_a
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v10

    .line 259
    .local v10, "resource":Landroid/content/res/Resources;
    const-string/jumbo v5, ""

    .line 262
    .local v5, "defaultCharset":Ljava/lang/String;
    const v15, 0x10400a7

    :try_start_1
    invoke-virtual {v10, v15}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;
    :try_end_1
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v5

    .line 266
    :goto_5
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    invoke-static {v0, v1, v2, v15}, Lcom/android/internal/telephony/GsmAlphabet;->gsm8BitUnpackedToString([BIILjava/lang/String;)Ljava/lang/String;

    move-result-object v15

    return-object v15

    .line 263
    :catch_1
    move-exception v6

    .local v6, "e":Landroid/content/res/Resources$NotFoundException;
    goto :goto_5
.end method

.method public static bcdToString([BII)Ljava/lang/String;
    .locals 5
    .param p0, "data"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I

    .prologue
    const/16 v4, 0x9

    .line 47
    new-instance v1, Ljava/lang/StringBuilder;

    mul-int/lit8 v3, p2, 0x2

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 49
    .local v1, "ret":Ljava/lang/StringBuilder;
    move v0, p1

    .local v0, "i":I
    :goto_0
    add-int v3, p1, p2

    if-ge v0, v3, :cond_0

    .line 53
    aget-byte v3, p0, v0

    and-int/lit8 v2, v3, 0xf

    .line 54
    .local v2, "v":I
    if-le v2, v4, :cond_1

    .line 64
    .end local v2    # "v":I
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 55
    .restart local v2    # "v":I
    :cond_1
    add-int/lit8 v3, v2, 0x30

    int-to-char v3, v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 57
    aget-byte v3, p0, v0

    shr-int/lit8 v3, v3, 0x4

    and-int/lit8 v2, v3, 0xf

    .line 59
    const/16 v3, 0xf

    if-ne v2, v3, :cond_2

    .line 49
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 60
    :cond_2
    if-gt v2, v4, :cond_0

    .line 61
    add-int/lit8 v3, v2, 0x30

    int-to-char v3, v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1
.end method

.method private static bitToRGB(I)I
    .locals 1
    .param p0, "bit"    # I

    .prologue
    .line 419
    const/4 v0, 0x1

    if-ne p0, v0, :cond_0

    .line 420
    const/4 v0, -0x1

    return v0

    .line 422
    :cond_0
    const/high16 v0, -0x1000000

    return v0
.end method

.method public static bytesToHexString([B)Ljava/lang/String;
    .locals 4
    .param p0, "bytes"    # [B

    .prologue
    const/4 v3, 0x0

    .line 316
    if-nez p0, :cond_0

    return-object v3

    .line 318
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    array-length v3, p0

    mul-int/lit8 v3, v3, 0x2

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 320
    .local v2, "ret":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, p0

    if-ge v1, v3, :cond_1

    .line 323
    aget-byte v3, p0, v1

    shr-int/lit8 v3, v3, 0x4

    and-int/lit8 v0, v3, 0xf

    .line 325
    .local v0, "b":I
    const-string/jumbo v3, "0123456789abcdef"

    invoke-virtual {v3, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 327
    aget-byte v3, p0, v1

    and-int/lit8 v0, v3, 0xf

    .line 329
    const-string/jumbo v3, "0123456789abcdef"

    invoke-virtual {v3, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 320
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 332
    .end local v0    # "b":I
    :cond_1
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static cdmaBcdByteToInt(B)I
    .locals 3
    .param p0, "b"    # B

    .prologue
    .line 129
    const/4 v0, 0x0

    .line 132
    .local v0, "ret":I
    and-int/lit16 v1, p0, 0xf0

    const/16 v2, 0x90

    if-gt v1, v2, :cond_0

    .line 133
    shr-int/lit8 v1, p0, 0x4

    and-int/lit8 v1, v1, 0xf

    mul-int/lit8 v0, v1, 0xa

    .line 136
    :cond_0
    and-int/lit8 v1, p0, 0xf

    const/16 v2, 0x9

    if-gt v1, v2, :cond_1

    .line 137
    and-int/lit8 v1, p0, 0xf

    add-int/2addr v0, v1

    .line 140
    :cond_1
    return v0
.end method

.method public static cdmaBcdToString([BII)Ljava/lang/String;
    .locals 6
    .param p0, "data"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I

    .prologue
    const/16 v5, 0x9

    .line 72
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, p2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 74
    .local v2, "ret":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .line 75
    .local v0, "count":I
    move v1, p1

    .local v1, "i":I
    :goto_0
    if-ge v0, p2, :cond_1

    .line 77
    aget-byte v4, p0, v1

    and-int/lit8 v3, v4, 0xf

    .line 78
    .local v3, "v":I
    if-le v3, v5, :cond_0

    const/4 v3, 0x0

    .line 79
    :cond_0
    add-int/lit8 v4, v3, 0x30

    int-to-char v4, v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 81
    add-int/lit8 v0, v0, 0x1

    if-ne v0, p2, :cond_2

    .line 88
    .end local v3    # "v":I
    :cond_1
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 83
    .restart local v3    # "v":I
    :cond_2
    aget-byte v4, p0, v1

    shr-int/lit8 v4, v4, 0x4

    and-int/lit8 v3, v4, 0xf

    .line 84
    if-le v3, v5, :cond_3

    const/4 v3, 0x0

    .line 85
    :cond_3
    add-int/lit8 v4, v3, 0x30

    int-to-char v4, v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 86
    add-int/lit8 v0, v0, 0x1

    .line 75
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private static getCLUT([BII)[I
    .locals 8
    .param p0, "rawData"    # [B
    .param p1, "offset"    # I
    .param p2, "number"    # I

    .prologue
    const/4 v6, 0x0

    .line 514
    if-nez p0, :cond_0

    .line 515
    return-object v6

    .line 518
    :cond_0
    new-array v3, p2, [I

    .line 519
    .local v3, "result":[I
    mul-int/lit8 v6, p2, 0x3

    add-int v2, p1, v6

    .line 520
    .local v2, "endIndex":I
    move v4, p1

    .line 521
    .local v4, "valueIndex":I
    const/4 v0, 0x0

    .line 524
    .local v0, "colorIndex":I
    :goto_0
    add-int/lit8 v1, v0, 0x1

    .line 525
    .end local v0    # "colorIndex":I
    .local v1, "colorIndex":I
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "valueIndex":I
    .local v5, "valueIndex":I
    aget-byte v6, p0, v4

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x10

    .line 522
    const/high16 v7, -0x1000000

    .line 524
    or-int/2addr v6, v7

    .line 526
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "valueIndex":I
    .restart local v4    # "valueIndex":I
    aget-byte v7, p0, v5

    and-int/lit16 v7, v7, 0xff

    shl-int/lit8 v7, v7, 0x8

    .line 524
    or-int/2addr v6, v7

    .line 527
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "valueIndex":I
    .restart local v5    # "valueIndex":I
    aget-byte v7, p0, v4

    and-int/lit16 v7, v7, 0xff

    .line 524
    or-int/2addr v6, v7

    aput v6, v3, v0

    .line 528
    if-ge v5, v2, :cond_1

    move v0, v1

    .end local v1    # "colorIndex":I
    .restart local v0    # "colorIndex":I
    move v4, v5

    .end local v5    # "valueIndex":I
    .restart local v4    # "valueIndex":I
    goto :goto_0

    .line 529
    .end local v0    # "colorIndex":I
    .end local v4    # "valueIndex":I
    .restart local v1    # "colorIndex":I
    .restart local v5    # "valueIndex":I
    :cond_1
    return-object v3
.end method

.method public static gsmBcdByteToInt(B)I
    .locals 3
    .param p0, "b"    # B

    .prologue
    .line 107
    const/4 v0, 0x0

    .line 110
    .local v0, "ret":I
    and-int/lit16 v1, p0, 0xf0

    const/16 v2, 0x90

    if-gt v1, v2, :cond_0

    .line 111
    shr-int/lit8 v1, p0, 0x4

    and-int/lit8 v0, v1, 0xf

    .line 114
    :cond_0
    and-int/lit8 v1, p0, 0xf

    const/16 v2, 0x9

    if-gt v1, v2, :cond_1

    .line 115
    and-int/lit8 v1, p0, 0xf

    mul-int/lit8 v1, v1, 0xa

    add-int/2addr v0, v1

    .line 118
    :cond_1
    return v0
.end method

.method static hexCharToInt(C)I
    .locals 3
    .param p0, "c"    # C

    .prologue
    .line 271
    const/16 v0, 0x30

    if-lt p0, v0, :cond_0

    const/16 v0, 0x39

    if-gt p0, v0, :cond_0

    add-int/lit8 v0, p0, -0x30

    return v0

    .line 272
    :cond_0
    const/16 v0, 0x41

    if-lt p0, v0, :cond_1

    const/16 v0, 0x46

    if-gt p0, v0, :cond_1

    add-int/lit8 v0, p0, -0x41

    add-int/lit8 v0, v0, 0xa

    return v0

    .line 273
    :cond_1
    const/16 v0, 0x61

    if-lt p0, v0, :cond_2

    const/16 v0, 0x66

    if-gt p0, v0, :cond_2

    add-int/lit8 v0, p0, -0x61

    add-int/lit8 v0, v0, 0xa

    return v0

    .line 275
    :cond_2
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "invalid hex char \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static hexStringToBytes(Ljava/lang/String;)[B
    .locals 6
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 292
    if-nez p0, :cond_0

    return-object v3

    .line 294
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 296
    .local v2, "sz":I
    div-int/lit8 v3, v2, 0x2

    new-array v1, v3, [B

    .line 298
    .local v1, "ret":[B
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v2, :cond_1

    .line 299
    div-int/lit8 v3, v0, 0x2

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Lcom/android/internal/telephony/uicc/IccUtils;->hexCharToInt(C)I

    move-result v4

    shl-int/lit8 v4, v4, 0x4

    .line 300
    add-int/lit8 v5, v0, 0x1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Lcom/android/internal/telephony/uicc/IccUtils;->hexCharToInt(C)I

    move-result v5

    .line 299
    or-int/2addr v4, v5

    int-to-byte v4, v4

    aput-byte v4, v1, v3

    .line 298
    add-int/lit8 v0, v0, 0x2

    goto :goto_0

    .line 303
    :cond_1
    return-object v1
.end method

.method private static mapTo2OrderBitColor([BII[II)[I
    .locals 11
    .param p0, "data"    # [B
    .param p1, "valueIndex"    # I
    .param p2, "length"    # I
    .param p3, "colorArray"    # [I
    .param p4, "bits"    # I

    .prologue
    const/16 v10, 0x8

    .line 464
    rem-int v9, v10, p4

    if-eqz v9, :cond_0

    .line 465
    const-string/jumbo v9, "IccUtils"

    const-string/jumbo v10, "not event number of color"

    invoke-static {v9, v10}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 466
    invoke-static {p0, p1, p2, p3, p4}, Lcom/android/internal/telephony/uicc/IccUtils;->mapToNon2OrderBitColor([BII[II)[I

    move-result-object v9

    return-object v9

    .line 470
    :cond_0
    const/4 v0, 0x1

    .line 471
    .local v0, "mask":I
    packed-switch p4, :pswitch_data_0

    .line 486
    :goto_0
    :pswitch_0
    new-array v2, p2, [I

    .line 487
    .local v2, "resultArray":[I
    const/4 v3, 0x0

    .line 488
    .local v3, "resultIndex":I
    div-int v5, v10, p4

    .local v5, "run":I
    move v8, p1

    .line 489
    .end local p1    # "valueIndex":I
    .local v8, "valueIndex":I
    :goto_1
    if-ge v3, p2, :cond_2

    .line 490
    add-int/lit8 p1, v8, 0x1

    .end local v8    # "valueIndex":I
    .restart local p1    # "valueIndex":I
    aget-byte v7, p0, v8

    .line 491
    .local v7, "tempByte":B
    const/4 v6, 0x0

    .local v6, "runIndex":I
    move v4, v3

    .end local v3    # "resultIndex":I
    .local v4, "resultIndex":I
    :goto_2
    if-ge v6, v5, :cond_1

    .line 492
    sub-int v9, v5, v6

    add-int/lit8 v1, v9, -0x1

    .line 493
    .local v1, "offset":I
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "resultIndex":I
    .restart local v3    # "resultIndex":I
    mul-int v9, v1, p4

    shr-int v9, v7, v9

    and-int/2addr v9, v0

    aget v9, p3, v9

    aput v9, v2, v4

    .line 491
    add-int/lit8 v6, v6, 0x1

    move v4, v3

    .end local v3    # "resultIndex":I
    .restart local v4    # "resultIndex":I
    goto :goto_2

    .line 473
    .end local v1    # "offset":I
    .end local v2    # "resultArray":[I
    .end local v4    # "resultIndex":I
    .end local v5    # "run":I
    .end local v6    # "runIndex":I
    .end local v7    # "tempByte":B
    :pswitch_1
    const/4 v0, 0x1

    .line 474
    goto :goto_0

    .line 476
    :pswitch_2
    const/4 v0, 0x3

    .line 477
    goto :goto_0

    .line 479
    :pswitch_3
    const/16 v0, 0xf

    .line 480
    goto :goto_0

    .line 482
    :pswitch_4
    const/16 v0, 0xff

    .line 483
    goto :goto_0

    .restart local v2    # "resultArray":[I
    .restart local v4    # "resultIndex":I
    .restart local v5    # "run":I
    .restart local v6    # "runIndex":I
    .restart local v7    # "tempByte":B
    :cond_1
    move v3, v4

    .end local v4    # "resultIndex":I
    .restart local v3    # "resultIndex":I
    move v8, p1

    .end local p1    # "valueIndex":I
    .restart local v8    # "valueIndex":I
    goto :goto_1

    .line 497
    .end local v6    # "runIndex":I
    .end local v7    # "tempByte":B
    :cond_2
    return-object v2

    .line 471
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_4
    .end packed-switch
.end method

.method private static mapToNon2OrderBitColor([BII[II)[I
    .locals 3
    .param p0, "data"    # [B
    .param p1, "valueIndex"    # I
    .param p2, "length"    # I
    .param p3, "colorArray"    # [I
    .param p4, "bits"    # I

    .prologue
    .line 502
    const/16 v1, 0x8

    rem-int/2addr v1, p4

    if-nez v1, :cond_0

    .line 503
    const-string/jumbo v1, "IccUtils"

    const-string/jumbo v2, "not odd number of color"

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 504
    invoke-static {p0, p1, p2, p3, p4}, Lcom/android/internal/telephony/uicc/IccUtils;->mapTo2OrderBitColor([BII[II)[I

    move-result-object v1

    return-object v1

    .line 508
    :cond_0
    new-array v0, p2, [I

    .line 510
    .local v0, "resultArray":[I
    return-object v0
.end method

.method public static networkNameToString([BII)Ljava/lang/String;
    .locals 7
    .param p0, "data"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I

    .prologue
    .line 345
    aget-byte v4, p0, p1

    and-int/lit16 v4, v4, 0x80

    const/16 v5, 0x80

    if-ne v4, v5, :cond_0

    const/4 v4, 0x1

    if-ge p2, v4, :cond_1

    .line 346
    :cond_0
    const-string/jumbo v4, ""

    return-object v4

    .line 349
    :cond_1
    aget-byte v4, p0, p1

    ushr-int/lit8 v4, v4, 0x4

    and-int/lit8 v4, v4, 0x7

    packed-switch v4, :pswitch_data_0

    .line 370
    const-string/jumbo v2, ""

    .line 378
    .local v2, "ret":Ljava/lang/String;
    :goto_0
    aget-byte v4, p0, p1

    and-int/lit8 v4, v4, 0x40

    if-eqz v4, :cond_2

    .line 383
    :cond_2
    return-object v2

    .line 353
    .end local v2    # "ret":Ljava/lang/String;
    :pswitch_0
    aget-byte v4, p0, p1

    and-int/lit8 v3, v4, 0x7

    .line 354
    .local v3, "unusedBits":I
    add-int/lit8 v4, p2, -0x1

    mul-int/lit8 v4, v4, 0x8

    sub-int/2addr v4, v3

    div-int/lit8 v0, v4, 0x7

    .line 355
    .local v0, "countSeptets":I
    add-int/lit8 v4, p1, 0x1

    invoke-static {p0, v4, v0}, Lcom/android/internal/telephony/GsmAlphabet;->gsm7BitPackedToString([BII)Ljava/lang/String;

    move-result-object v2

    .restart local v2    # "ret":Ljava/lang/String;
    goto :goto_0

    .line 360
    .end local v0    # "countSeptets":I
    .end local v2    # "ret":Ljava/lang/String;
    .end local v3    # "unusedBits":I
    :pswitch_1
    :try_start_0
    new-instance v2, Ljava/lang/String;

    .line 361
    add-int/lit8 v4, p1, 0x1

    add-int/lit8 v5, p2, -0x1

    const-string/jumbo v6, "utf-16"

    .line 360
    invoke-direct {v2, p0, v4, v5, v6}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .restart local v2    # "ret":Ljava/lang/String;
    goto :goto_0

    .line 362
    .end local v2    # "ret":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 363
    .local v1, "ex":Ljava/io/UnsupportedEncodingException;
    const-string/jumbo v2, ""

    .line 364
    .restart local v2    # "ret":Ljava/lang/String;
    const-string/jumbo v4, "IccUtils"

    const-string/jumbo v5, "implausible UnsupportedEncodingException"

    invoke-static {v4, v5, v1}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 349
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static parseToBnW([BI)Landroid/graphics/Bitmap;
    .locals 13
    .param p0, "data"    # [B
    .param p1, "length"    # I

    .prologue
    const/4 v11, 0x0

    .line 394
    const/4 v8, 0x1

    .local v8, "valueIndex":I
    aget-byte v11, p0, v11

    and-int/lit16 v10, v11, 0xff

    .line 395
    .local v10, "width":I
    add-int/lit8 v9, v8, 0x1

    .end local v8    # "valueIndex":I
    .local v9, "valueIndex":I
    aget-byte v11, p0, v8

    and-int/lit16 v3, v11, 0xff

    .line 396
    .local v3, "height":I
    mul-int v4, v10, v3

    .line 398
    .local v4, "numOfPixels":I
    new-array v7, v4, [I

    .line 400
    .local v7, "pixels":[I
    const/4 v5, 0x0

    .line 401
    .local v5, "pixelIndex":I
    const/4 v0, 0x7

    .line 402
    .local v0, "bitIndex":I
    const/4 v2, 0x0

    .local v2, "currentByte":B
    move v6, v5

    .line 403
    .end local v2    # "currentByte":B
    .end local v5    # "pixelIndex":I
    .local v6, "pixelIndex":I
    :goto_0
    if-ge v6, v4, :cond_0

    .line 405
    rem-int/lit8 v11, v6, 0x8

    if-nez v11, :cond_2

    .line 406
    add-int/lit8 v8, v9, 0x1

    .end local v9    # "valueIndex":I
    .restart local v8    # "valueIndex":I
    aget-byte v2, p0, v9

    .line 407
    .local v2, "currentByte":B
    const/4 v0, 0x7

    .line 409
    .end local v2    # "currentByte":B
    :goto_1
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "pixelIndex":I
    .restart local v5    # "pixelIndex":I
    add-int/lit8 v1, v0, -0x1

    .end local v0    # "bitIndex":I
    .local v1, "bitIndex":I
    shr-int v11, v2, v0

    and-int/lit8 v11, v11, 0x1

    invoke-static {v11}, Lcom/android/internal/telephony/uicc/IccUtils;->bitToRGB(I)I

    move-result v11

    aput v11, v7, v6

    move v0, v1

    .end local v1    # "bitIndex":I
    .restart local v0    # "bitIndex":I
    move v6, v5

    .end local v5    # "pixelIndex":I
    .restart local v6    # "pixelIndex":I
    move v9, v8

    .end local v8    # "valueIndex":I
    .restart local v9    # "valueIndex":I
    goto :goto_0

    .line 412
    :cond_0
    if-eq v6, v4, :cond_1

    .line 413
    const-string/jumbo v11, "IccUtils"

    const-string/jumbo v12, "parse end and size error"

    invoke-static {v11, v12}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 415
    :cond_1
    sget-object v11, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v7, v10, v3, v11}, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v11

    return-object v11

    :cond_2
    move v8, v9

    .end local v9    # "valueIndex":I
    .restart local v8    # "valueIndex":I
    goto :goto_1
.end method

.method public static parseToRGB([BIZ)Landroid/graphics/Bitmap;
    .locals 12
    .param p0, "data"    # [B
    .param p1, "length"    # I
    .param p2, "transparency"    # Z

    .prologue
    const/4 v11, 0x0

    .line 437
    const/4 v6, 0x1

    .local v6, "valueIndex":I
    aget-byte v9, p0, v11

    and-int/lit16 v8, v9, 0xff

    .line 438
    .local v8, "width":I
    add-int/lit8 v7, v6, 0x1

    .end local v6    # "valueIndex":I
    .local v7, "valueIndex":I
    aget-byte v9, p0, v6

    and-int/lit16 v4, v9, 0xff

    .line 439
    .local v4, "height":I
    add-int/lit8 v6, v7, 0x1

    .end local v7    # "valueIndex":I
    .restart local v6    # "valueIndex":I
    aget-byte v9, p0, v7

    and-int/lit16 v0, v9, 0xff

    .line 440
    .local v0, "bits":I
    add-int/lit8 v7, v6, 0x1

    .end local v6    # "valueIndex":I
    .restart local v7    # "valueIndex":I
    aget-byte v9, p0, v6

    and-int/lit16 v3, v9, 0xff

    .line 441
    .local v3, "colorNumber":I
    add-int/lit8 v6, v7, 0x1

    .end local v7    # "valueIndex":I
    .restart local v6    # "valueIndex":I
    aget-byte v9, p0, v7

    and-int/lit16 v9, v9, 0xff

    shl-int/lit8 v9, v9, 0x8

    .line 442
    add-int/lit8 v7, v6, 0x1

    .end local v6    # "valueIndex":I
    .restart local v7    # "valueIndex":I
    aget-byte v10, p0, v6

    and-int/lit16 v10, v10, 0xff

    .line 441
    or-int v1, v9, v10

    .line 444
    .local v1, "clutOffset":I
    invoke-static {p0, v1, v3}, Lcom/android/internal/telephony/uicc/IccUtils;->getCLUT([BII)[I

    move-result-object v2

    .line 445
    .local v2, "colorIndexArray":[I
    if-eqz p2, :cond_0

    .line 446
    add-int/lit8 v9, v3, -0x1

    aput v11, v2, v9

    .line 449
    :cond_0
    const/4 v5, 0x0

    .line 450
    .local v5, "resultArray":[I
    const/16 v9, 0x8

    rem-int/2addr v9, v0

    if-nez v9, :cond_1

    .line 452
    mul-int v9, v8, v4

    .line 451
    invoke-static {p0, v7, v9, v2, v0}, Lcom/android/internal/telephony/uicc/IccUtils;->mapTo2OrderBitColor([BII[II)[I

    move-result-object v5

    .line 459
    .local v5, "resultArray":[I
    :goto_0
    sget-object v9, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    .line 458
    invoke-static {v5, v8, v4, v9}, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v9

    return-object v9

    .line 455
    .local v5, "resultArray":[I
    :cond_1
    mul-int v9, v8, v4

    .line 454
    invoke-static {p0, v7, v9, v2, v0}, Lcom/android/internal/telephony/uicc/IccUtils;->mapToNon2OrderBitColor([BII[II)[I

    move-result-object v5

    .local v5, "resultArray":[I
    goto :goto_0
.end method

.method static stringToAdnStringField(Ljava/lang/String;)[B
    .locals 5
    .param p0, "alphaTag"    # Ljava/lang/String;

    .prologue
    .line 534
    const/4 v2, 0x0

    .line 536
    .local v2, "isUcs2":Z
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v1, v3, :cond_0

    .line 537
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/4 v4, 0x1

    invoke-static {v3, v4}, Lcom/android/internal/telephony/GsmAlphabet;->countGsmSeptets(CZ)I
    :try_end_0
    .catch Lcom/android/internal/telephony/EncodeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 536
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 539
    :catch_0
    move-exception v0

    .line 540
    .local v0, "e":Lcom/android/internal/telephony/EncodeException;
    const/4 v2, 0x1

    .line 542
    .end local v0    # "e":Lcom/android/internal/telephony/EncodeException;
    :cond_0
    invoke-static {p0, v2}, Lcom/android/internal/telephony/uicc/IccUtils;->stringToAdnStringField(Ljava/lang/String;Z)[B

    move-result-object v3

    return-object v3
.end method

.method static stringToAdnStringField(Ljava/lang/String;Z)[B
    .locals 5
    .param p0, "alphaTag"    # Ljava/lang/String;
    .param p1, "isUcs2"    # Z

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 547
    if-nez p1, :cond_0

    .line 548
    invoke-static {p0}, Lcom/android/internal/telephony/GsmAlphabet;->stringToGsm8BitPacked(Ljava/lang/String;)[B

    move-result-object v2

    return-object v2

    .line 550
    :cond_0
    const-string/jumbo v2, "UTF-16BE"

    invoke-static {v2}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    .line 551
    .local v0, "alphaTagBytes":[B
    array-length v2, v0

    add-int/lit8 v2, v2, 0x1

    new-array v1, v2, [B

    .line 552
    .local v1, "ret":[B
    const/16 v2, -0x80

    aput-byte v2, v1, v3

    .line 553
    array-length v2, v0

    invoke-static {v0, v3, v1, v4, v2}, Ljava/lang/System;->arraycopy([BI[BII)V

    .line 555
    return-object v1
.end method
