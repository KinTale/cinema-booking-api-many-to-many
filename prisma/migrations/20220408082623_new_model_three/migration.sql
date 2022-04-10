/*
  Warnings:

  - The primary key for the `Seat` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `Seat` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "_SeatToTicket" DROP CONSTRAINT "_SeatToTicket_A_fkey";

-- DropIndex
DROP INDEX "Seat_seatType_key";

-- AlterTable
ALTER TABLE "Seat" DROP CONSTRAINT "Seat_pkey",
DROP COLUMN "id",
ADD CONSTRAINT "Seat_pkey" PRIMARY KEY ("seatType");

-- AlterTable
ALTER TABLE "_SeatToTicket" ALTER COLUMN "A" SET DATA TYPE TEXT;

-- AddForeignKey
ALTER TABLE "_SeatToTicket" ADD FOREIGN KEY ("A") REFERENCES "Seat"("seatType") ON DELETE CASCADE ON UPDATE CASCADE;
