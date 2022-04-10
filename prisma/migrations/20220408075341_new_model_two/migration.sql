/*
  Warnings:

  - You are about to drop the `_CustomerToSeat` table. If the table is not empty, all the data it contains will be lost.
  - Made the column `screenId` on table `Seat` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "_CustomerToSeat" DROP CONSTRAINT "_CustomerToSeat_A_fkey";

-- DropForeignKey
ALTER TABLE "_CustomerToSeat" DROP CONSTRAINT "_CustomerToSeat_B_fkey";

-- DropForeignKey
ALTER TABLE "Seat" DROP CONSTRAINT "Seat_screenId_fkey";

-- DropForeignKey
ALTER TABLE "Seat" DROP CONSTRAINT "Seat_ticketId_fkey";

-- AlterTable
ALTER TABLE "Seat" ALTER COLUMN "screenId" SET NOT NULL;

-- DropTable
DROP TABLE "_CustomerToSeat";

-- CreateTable
CREATE TABLE "_SeatToTicket" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_SeatToTicket_AB_unique" ON "_SeatToTicket"("A", "B");

-- CreateIndex
CREATE INDEX "_SeatToTicket_B_index" ON "_SeatToTicket"("B");

-- AddForeignKey
ALTER TABLE "Seat" ADD CONSTRAINT "Seat_screenId_fkey" FOREIGN KEY ("screenId") REFERENCES "Screen"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_SeatToTicket" ADD FOREIGN KEY ("A") REFERENCES "Seat"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_SeatToTicket" ADD FOREIGN KEY ("B") REFERENCES "Ticket"("id") ON DELETE CASCADE ON UPDATE CASCADE;
