print("=== Dark Matter Scan for Q7(x) Dimension-Reduced Elliptic Curve E1 ===")
print("Base Curve E1: Y^2 = X^3 + 14*X^2 + 49*X + 49\n")

D_values = [1, 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47]

for D in D_values:
    # Construct the D-twisted elliptic curve: Y^2 = X^3 + 14*D*X^2 + 49*D^2*X + 49*D^3
    E = EllipticCurve([0, 14*D, 0, 49*D**2, 49*D**3])
    
    try:
        selmer = E.selmer_rank()
        analytic = E.analytic_rank()
        
        if selmer > analytic:
            # Sha group captured!
            sha_order = E.sha().an()
            status = f"⚠️ Deep Abyss Dark Matter Captured! Sha order ≈ {round(sha_order)}"
        else:
            status = "Structurally smooth"
            
        print(f"D = {D:<2} | Conductor N = {E.conductor():<7} | Selmer Rank = {selmer} | Analytic Rank = {analytic} | {status}")
    except Exception as e:
        print(f"D = {D:<2} | Computation error: {e}")