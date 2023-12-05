-- AlterTable
ALTER TABLE "padroes" ADD COLUMN     "num" STRING;

-- AlterTable
ALTER TABLE "users" ADD COLUMN     "resetPasswordExpires" STRING;
ALTER TABLE "users" ADD COLUMN     "resetPasswordToken" STRING;
