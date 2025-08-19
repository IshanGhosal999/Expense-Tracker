/*
  Warnings:

  - You are about to drop the column `creartedAt` on the `Record` table. All the data in the column will be lost.
  - You are about to drop the column `userID` on the `Record` table. All the data in the column will be lost.
  - Added the required column `userId` to the `Record` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "public"."Record" DROP CONSTRAINT "Record_userID_fkey";

-- DropIndex
DROP INDEX "public"."Record_userID_idx";

-- AlterTable
ALTER TABLE "public"."Record" DROP COLUMN "creartedAt",
DROP COLUMN "userID",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "userId" TEXT NOT NULL,
ALTER COLUMN "category" SET DEFAULT 'Other';

-- CreateIndex
CREATE INDEX "Record_userId_idx" ON "public"."Record"("userId");

-- AddForeignKey
ALTER TABLE "public"."Record" ADD CONSTRAINT "Record_userId_fkey" FOREIGN KEY ("userId") REFERENCES "public"."User"("clerkUserId") ON DELETE CASCADE ON UPDATE CASCADE;
