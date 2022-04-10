-- DropForeignKey
ALTER TABLE "Seat" DROP CONSTRAINT "Seat_screenId_fkey";

-- DropForeignKey
ALTER TABLE "Seat" DROP CONSTRAINT "Seat_ticketId_fkey";

-- AlterTable
ALTER TABLE "Seat" ALTER COLUMN "ticketId" DROP NOT NULL,
ALTER COLUMN "screenId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "Seat" ADD CONSTRAINT "Seat_ticketId_fkey" FOREIGN KEY ("ticketId") REFERENCES "Ticket"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Seat" ADD CONSTRAINT "Seat_screenId_fkey" FOREIGN KEY ("screenId") REFERENCES "Screen"("id") ON DELETE SET NULL ON UPDATE CASCADE;
