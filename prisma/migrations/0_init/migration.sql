-- CreateTable
CREATE TABLE "Categories" (
    "categoryId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "categoryName" TEXT,
    "description" TEXT,
    "picture" BLOB
);

-- CreateTable
CREATE TABLE "CustomerCustomerDemo" (
    "customerId" TEXT NOT NULL,
    "customerTypeId" TEXT NOT NULL,

    PRIMARY KEY ("customerId", "customerTypeId"),
    CONSTRAINT "CustomerCustomerDemo_customerTypeId_fkey" FOREIGN KEY ("customerTypeId") REFERENCES "CustomerDemographics" ("customerTypeId") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "CustomerCustomerDemo_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customers" ("CustomerID") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "CustomerDemographics" (
    "customerTypeId" TEXT NOT NULL PRIMARY KEY,
    "customerDesc" TEXT
);

-- CreateTable
CREATE TABLE "Customers" (
    "CustomerID" TEXT PRIMARY KEY,
    "CompanyName" TEXT,
    "ContactName" TEXT,
    "ContactTitle" TEXT,
    "Address" TEXT,
    "City" TEXT,
    "Region" TEXT,
    "PostalCode" TEXT,
    "Country" TEXT,
    "Phone" TEXT,
    "Fax" TEXT
);

-- CreateTable
CREATE TABLE "EmployeeTerritories" (
    "employeeId" INTEGER NOT NULL,
    "territoryId" TEXT NOT NULL,

    PRIMARY KEY ("employeeId", "territoryId"),
    CONSTRAINT "EmployeeTerritories_territoryId_fkey" FOREIGN KEY ("territoryId") REFERENCES "Territories" ("territoryId") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "EmployeeTerritories_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES "Employees" ("employeeId") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "Employees" (
    "employeeId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "lastName" TEXT,
    "firstName" TEXT,
    "title" TEXT,
    "titleOfCourtesy" TEXT,
    "birthDate" DATETIME,
    "hireDate" DATETIME,
    "address" TEXT,
    "city" TEXT,
    "region" TEXT,
    "postalCode" TEXT,
    "country" TEXT,
    "homePhone" TEXT,
    "extension" TEXT,
    "photo" BLOB,
    "notes" TEXT,
    "reportsTo" INTEGER,
    "photoPath" TEXT,
    CONSTRAINT "Employees_reportsTo_fkey" FOREIGN KEY ("reportsTo") REFERENCES "Employees" ("employeeId") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "Order Details" (
    "orderId" INTEGER NOT NULL,
    "productId" INTEGER NOT NULL,
    "unitPrice" REAL NOT NULL DEFAULT 0,
    "quantity" INTEGER NOT NULL DEFAULT 1,
    "discount" REAL NOT NULL DEFAULT 0,

    PRIMARY KEY ("orderId", "productId"),
    CONSTRAINT "Order Details_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Products" ("productId") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "Order Details_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "Orders" ("orderId") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "Orders" (
    "orderId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "customerId" TEXT,
    "employeeId" INTEGER,
    "orderDate" TEXT,
    "requiredDate" TEXT,
    "shippedDate" TEXT,
    "shipVia" INTEGER,
    "freight" REAL DEFAULT 0,
    "shipName" TEXT,
    "shipAddress" TEXT,
    "shipCity" TEXT,
    "shipRegion" TEXT,
    "shipPostalCode" TEXT,
    "shipCountry" TEXT,
    CONSTRAINT "Orders_shipVia_fkey" FOREIGN KEY ("shipVia") REFERENCES "Shippers" ("shipperId") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "Orders_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customers" ("CustomerID") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "Orders_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES "Employees" ("employeeId") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "Products" (
    "productId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "productName" TEXT NOT NULL,
    "supplierId" INTEGER,
    "categoryId" INTEGER,
    "quantityPerUnit" TEXT,
    "unitPrice" REAL DEFAULT 0,
    "unitsInStock" INTEGER DEFAULT 0,
    "unitsOnOrder" INTEGER DEFAULT 0,
    "reorderLevel" INTEGER DEFAULT 0,
    "discontinued" TEXT NOT NULL DEFAULT '0',
    CONSTRAINT "Products_supplierId_fkey" FOREIGN KEY ("supplierId") REFERENCES "Suppliers" ("supplierId") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "Products_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "Categories" ("categoryId") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "Regions" (
    "regionId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "regionDescription" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Shippers" (
    "shipperId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "companyName" TEXT NOT NULL,
    "phone" TEXT
);

-- CreateTable
CREATE TABLE "Suppliers" (
    "supplierId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "companyName" TEXT NOT NULL,
    "contactName" TEXT,
    "contactTitle" TEXT,
    "address" TEXT,
    "city" TEXT,
    "region" TEXT,
    "postalCode" TEXT,
    "country" TEXT,
    "phone" TEXT,
    "fax" TEXT,
    "homePage" TEXT
);

-- CreateTable
CREATE TABLE "Territories" (
    "territoryId" TEXT NOT NULL PRIMARY KEY,
    "territoryDescription" TEXT NOT NULL,
    "regionId" INTEGER NOT NULL,
    CONSTRAINT "Territories_regionId_fkey" FOREIGN KEY ("regionId") REFERENCES "Regions" ("regionId") ON DELETE NO ACTION ON UPDATE NO ACTION
);

