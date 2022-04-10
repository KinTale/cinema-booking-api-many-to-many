-- CreateTable
CREATE TABLE "Seat" (
    "id" SERIAL NOT NULL,
    "seatType" TEXT NOT NULL,
    "ticketId" INTEGER NOT NULL,
    "screenId" INTEGER NOT NULL,

    CONSTRAINT "Seat_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_CustomerToSeat" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Seat_seatType_key" ON "Seat"("seatType");

-- CreateIndex
CREATE UNIQUE INDEX "_CustomerToSeat_AB_unique" ON "_CustomerToSeat"("A", "B");

-- CreateIndex
CREATE INDEX "_CustomerToSeat_B_index" ON "_CustomerToSeat"("B");

-- AddForeignKey
ALTER TABLE "Seat" ADD CONSTRAINT "Seat_ticketId_fkey" FOREIGN KEY ("ticketId") REFERENCES "Ticket"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Seat" ADD CONSTRAINT "Seat_screenId_fkey" FOREIGN KEY ("screenId") REFERENCES "Screen"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CustomerToSeat" ADD FOREIGN KEY ("A") REFERENCES "Customer"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CustomerToSeat" ADD FOREIGN KEY ("B") REFERENCES "Seat"("id") ON DELETE CASCADE ON UPDATE CASCADE;
